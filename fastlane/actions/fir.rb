module Fastlane
  module Actions
    module SharedValues
      FIR_DOWNLOAD_LINK = :FIR_DOWNLOAD_LINK
    end

    class FirAction < Action
      def self.run(params)
        script = "fir publish #{params[:apk_path]} -T #{params[:api_token]}"
        script += " -c #{params[:changelog]}" unless params[:changelog].empty?
        sh script

        # Actions.lane_context[SharedValues::FIR_DOWNLOAD_LINK] = ""
      end

      #####################################################
      # @!group Documentation
      #####################################################
      def self.description
        "Upload a new build to fir.im"
      end

      def self.details
        "Based on fir-cli"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                       env_name: "FL_FIR_API_TOKEN",
                                       description: "API Token for fir.im",
                                       sensitive: true,
                                       verify_block: proc do |value|
                                          UI.user_error!("No API token for FirAction given, pass using `api_token: 'token'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :apk_path,
                                       env_name: "FL_FIR_APK_PATH",
                                       description: "Path to your APK file. Optional if you use the gradle action",
                                       default_value: lane_context[SharedValues::GRADLE_APK_OUTPUT_PATH],
                                       verify_block: proc do |value|
                                        UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :changelog,
                                       env_name: "FL_FIR_CHANGELOG",
                                       description: "Release ChangeLog, support string or file path",
                                       default_value: "")
        ]
      end

      def self.output
        [
          # ['FIR_DOWNLOAD_LINK', 'The newly generated download link for this build']
        ]
      end
      
      def self.authors
        ["dongorigin"]
      end

      def self.is_supported?(platform)
        # ios coming soon
        # [:android, :ios].include?(platform)
        platform == :android
      end

      def self.category
        :beta
      end
    end
  end
end
