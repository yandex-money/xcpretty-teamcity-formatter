class TeamCityFormatter < XCPretty::Simple
  def initialize(use_unicode, colorize)
    super
    log compile_group(false)
    at_exit do
      log compile_group(true)
    end
  end

  # Errors and warnings.
  def format_compile_error(_, file_path, reason, line, cursor)
    details = "#{file_path}: #{reason}\n#{line}\n#{cursor}"
    compile_error('Compile error', details)
  end

  def format_error(message)
    compile_error('Error', super)
  end

  def format_file_missing_error(error, file_path)
    compile_error('Error', "#{file_path}: #{error}")
  end

  def format_ld_warning(message)
    compile_error('LD warning', super)
  end

  def format_undefined_symbols(message, symbol, reference)
    details = "#{message}\n" \
      "> Symbol: #{symbol}\n" \
      "> Referenced from: #{reference}"
    compile_error('Undefined symbols', details)
  end

  def format_duplicate_symbols(message, file_paths)
    details = "#{message}" \
      "> #{file_paths.join("\n> ")}"
    compile_error('Duplicate symbols', details)
  end

  def format_warning(message)
    compile_error('Warning', message)
  end

  def format_compile_warning(_, file_path, reason, line, cursor)
    details = "#{file_path}: #{reason}\n#{line}\n#{cursor}"
    compile_error('Compile warning', details)
  end

  private

  # @param [String] str
  def log(str)
    STDOUT.puts str
  end

  # @param [String] message
  # @param [String] unformatted_details
  # @param [Bool] warning
  # @return [String]
  def compile_error(message, unformatted_details, warning = false)
    status = warning ? 'WARNING' : 'ERROR'
    str    = "##teamcity[message text='#{message}' "
    unless warning
      error_details = format_error_details(unformatted_details)
      str           += "errorDetails='#{error_details}' "
    end
    str + "status='#{status}']\n"
  end

  # @param [Bool] finished
  # @return [String]
  def compile_group(finished)
    command = finished ? 'compilationFinished' : 'compilationStarted'
    "##teamcity[#{command} compiler='xcodebuild']"
  end

  # @param [String] str
  # @return [String]
  def format_error_details(str)
    str.gsub('|', '||')
       .gsub("\n", '|n')
       .gsub("'", "|'")
       .gsub('[', '|[')
       .gsub(']', '|]')

  end
end

TeamCityFormatter
