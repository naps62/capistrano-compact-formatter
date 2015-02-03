module SSHKit
  module Formatter
    class Compact < Abstract
      CMD_LEN = 80
      CMD_SPACE = 10

      def initialize(*args)
        super
        @stdout = StringIO.new
        @stderr = StringIO.new
      end

      def write(obj)
        case obj
        when SSHKit::Command then write_command(obj)
        when SSHKit::LogMessage then write_log_message(obj)
        else
          original_output << c.black(c.on_yellow("Output formatter doesn't know how to handle #{obj.class}\n"))
        end
      end

      alias :<< :write

      private

      def write_command(command)
        return if command.to_command[0] == '['

        command_start = pretty_command(command)[0..CMD_LEN-1].ljust(CMD_LEN).gsub(/[^\s]{3}$/, '...').ljust(CMD_LEN+CMD_SPACE)

        if !command.started?
          original_output << c.blue(command_start)
        end


        @stdout << formatted_stream(command.stdout)
        @stderr << formatted_stream(command.stderr)

        if command.finished?
          original_output << c.bold { command.failure? ? c.red('failure') : c.green('success') }
          original_output << "\n"

          if command.failure?
            original_output << c.red(command.to_command)
          end

          original_output << c.green(@stdout.string)
          original_output << c.red(@stderr.string)

          @stdout = StringIO.new
          @stderr = StringIO.new
        end
      end

      def write_log_message(log_message)
        original_output << "  #{log_message.to_s}"
      end

      def c
        Color
      end

      def pretty_command(command)
        "#{command.command} #{command.args.join(' ')}"
      end

      def formatted_stream(stream)
        stream.lines.map do |line|
          "\t#{line}"
        end.join('\n')
      end
    end
  end
end
