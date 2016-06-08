# Interface to R
module BioTCM::Interfaces::R
  include Interface

  # Run R script
  # @param script_path [String] path to the script
  # @param rscript_path [String] path to rscript
  def run_r_script(script_path, rscript_path: 'Rscript')
    raise ArgumentError, 'A valid R script required' unless /\.R$/i =~ script_path
    system("#{rscript_path} #{script_path}")
  end

  # Evaluate R script
  # @param rscript_path [String] path to rscript
  # @see Interface#render_template
  def evaluate_r_script(template_path, context, rscript_path: 'Rscript')
    raise ArgumentError, 'A valid R script template required' unless /\.R\.erb$/i =~ template_path
    run_r_script(render_template(template_path, context).path, rscript_path: rscript_path)
  end
end
