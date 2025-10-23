module DataLayer
  module Objects
    class Information

      def initialize(name, version, url, publisher)
        @name = name
        @version = version
        @url = url
        @publisher = publisher
      end
    end
  end
end
