module DataLayer
  module Binders
    class Information
      def build
        return DataLayer::Objects::Information.new(
          "Habsburg",
          "0.0.1",
          "www.habsburg.ch",
          "publisher"
        )
      end
    end
  end
end
