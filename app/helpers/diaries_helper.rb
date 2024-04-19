module DiariesHelper
  def jazz_cafe_options
    JazzCafe.all.map { |jazz_cafe| [jazz_cafe.name, jazz_cafe.id] }
  end
end
