class Template

  CFDG_PARAMS = ['-', "/tmp/%03<inc>i.png"]

  attr_accessor :file,
                :template,
                :dry_run,
                :autoincrement,
                :autoincrement_counter

  def initialize(options={})
    @autoincrement_counter = 1
    @autoincrement = true
    (options || {}).each do |k, v|
      instance_variable_set :"@#{k}", v
    end
  end

  def render(template_params=nil, cfdg_params=CFDG_PARAMS)
    ensure_template
    if @dry_run
      puts template_params.inspect
    else
      params = ['cfdg'] + cfdg_params
      params[-1] = params[-1] % {:inc => @autoincrement_counter} if @autoincrement
      IO.popen(params, 'r+') do |io|
        io.puts unfold_template(template_params)
        io.close_write
        io.read
      end
      @autoincrement_counter += 1
    end
    self
  end

  private

  def ensure_template
    if @template.is_a? String
      @template
    elsif @file.is_a? String
      @template = File.read(@file)
    elsif @file.is_a? IO
      @template = @file.read
    else
      raise TypeError.new('No template found')
    end
  end

  def unfold_template(params)
    if params
      @template % params
    else
      @template
    end
  end
end
