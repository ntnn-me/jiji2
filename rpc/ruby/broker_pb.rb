# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: broker.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
require 'google/protobuf/timestamp_pb'
require 'agent_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "jiji.rpc.GetPairsRequest" do
    optional :instance_id, :string, 1
  end
  add_message "jiji.rpc.GetPairsResponse" do
    repeated :pairs, :message, 1, "jiji.rpc.Pair"
  end
  add_message "jiji.rpc.Pair" do
    optional :name, :string, 1
    optional :internal_id, :string, 2
    optional :pip, :double, 3
    optional :max_trade_units, :uint64, 4
    optional :precision, :double, 5
    optional :margin_rate, :double, 6
  end
  add_message "jiji.rpc.GetTickRequest" do
    optional :instance_id, :string, 1
  end
  add_message "jiji.rpc.RetrieveRatesRequest" do
    optional :instance_id, :string, 1
    optional :pair_name, :string, 2
    optional :interval, :string, 3
    optional :start_time, :message, 4, "google.protobuf.Timestamp"
    optional :end_time, :message, 5, "google.protobuf.Timestamp"
  end
  add_message "jiji.rpc.Rates" do
    repeated :rates, :message, 1, "jiji.rpc.Rate"
  end
  add_message "jiji.rpc.Rate" do
    optional :pair, :string, 1
    optional :open, :message, 2, "jiji.rpc.Tick.Value"
    optional :close, :message, 3, "jiji.rpc.Tick.Value"
    optional :high, :message, 4, "jiji.rpc.Tick.Value"
    optional :low, :message, 5, "jiji.rpc.Tick.Value"
    optional :timestamp, :message, 6, "google.protobuf.Timestamp"
    optional :volume, :uint64, 7
  end
end

module Jiji
  module Rpc
    GetPairsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.GetPairsRequest").msgclass
    GetPairsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.GetPairsResponse").msgclass
    Pair = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.Pair").msgclass
    GetTickRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.GetTickRequest").msgclass
    RetrieveRatesRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.RetrieveRatesRequest").msgclass
    Rates = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.Rates").msgclass
    Rate = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.Rate").msgclass
  end
end
