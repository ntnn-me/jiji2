# coding: utf-8

require 'jiji/configurations/mongoid_configuration'
require 'jiji/model/trading/brokers/abstract_broker'

module Jiji
module Model
module Trading
module Brokers

  class RMTBroker < AbstractBroker
    
    include Encase
    
    needs :rmt_broker_setting

    def has_next
      true
    end
    
    def positions
      check_setting_finished
      super
    end
    
    def buy( pair_id, count=1 )
      order(pair_id, :buy, count )
    end
    
    def sell( pair_id, count=1 )
      order(pair_id, :sell, count )
    end
    
    def order( pair_id, type, count )
      check_setting_finished
      position = securities.order(pair_id, type, count)
      @positions[position.position_id] = position
      return position
    end
    
    def commit( position_id, count=1 )
      securities.commit(position_id, count)
    end
    
    def destroy
      securities.destroy_plugin if securities
    end
  
  protected
    def retrieve_pairs
      securities ? convert_pairs(securities.list_pairs) : []
    end
    def retrieve_rates
      securities ? convert_rates(securities.list_rates) 
                 : Jiji::Model::Trading::NilTick.new
    end
  
  private
    def check_setting_finished
      raise Jiji::Errors::NotInitializedException.new unless securities
    end
    def securities
      @rmt_broker_setting.active_securities
    end
    def convert_rates(rate, timestamp=Time.now )
      values = rate.reduce({}){|r,p|
        r[p[0]] = convert_rate_to_tick(p[1])
        r
      }
      Tick.create(values, timestamp)
    end
    def convert_rate_to_tick( r )
      Tick::Value.new(r.bid, r.ask, r.buy_swap, r.sell_swap) 
    end
    def convert_pairs(pairs)
      instance = Jiji::Model::Trading::Pairs.instance
      pairs.map {|p| Pairs.instance.create_or_get(p.name) }
    end
  end

end
end
end
end