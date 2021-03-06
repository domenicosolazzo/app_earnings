require 'thor'

module AppEarnings
  # Command-line utility: Retrieves CSV file
  # and generates a report based into it.
  class Cli < Thor
    desc 'play PlayApps.csv', 'Generates a detailed report'\
                              ' for the provided Google Play transaction file'
    method_option :format, type: :string, default: 'text',
                           aliases: '-f', enum: %w(text json)
    def play(name)
      if File.exists?(name)
        AppEarnings.play_report(name, options[:format])
      else
        puts "File '#{name}' not found!"
      end
    end

    desc 'amazon PaymentReport.csv EarningsReport.csv', 'Generates a '\
                          'detailed report for the Amazon report files'
    method_option :format, type: :string, default: 'text',
                           aliases: '-f', enum: %w(text json)
    def amazon(payments, earnings)
      if File.exists?(payments) && File.exists?(earnings)
        AppEarnings.amazon_report(payments, earnings, options[:format])
      else
        puts "Files '#{payments}' and '#{earnings}' were not found!"
      end
    end
  end
end
