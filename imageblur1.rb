class Image
  def initialize(image_arr)
    @image = image_arr
  end

  def output_image
    @image.each do |row|
      row.each do |col|
        print col
      end
      puts ""
    end
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts "original"
image.output_image
