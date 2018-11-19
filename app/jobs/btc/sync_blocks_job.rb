module Btc
  class SyncBlocksJob < ApplicationJob

    sidekiq_options unique: :until_executed, on_conflict: :log, queue: "btc"

    def perform(block_hashes)
      SyncBlocks.(block_hashes)
    end

  end
end
