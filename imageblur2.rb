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

  def blur_image
    rownum = 0
    @newimage = Array.new
    @image.length.times do |row|
      @newimage[row] = Array.new
    end
    @image.each do |row|
      colnum = 0
      row.each do |col|
        if col == 1
          if rownum > 0
            @newimage[rownum-1][colnum] = 1
          end
          if rownum < @image.length - 1
            @newimage[rownum+1][colnum] = 1
          end
          if colnum > 0
            @newimage[rownum][colnum-1] = 1
          end
          if colnum < row.length - 1
            @newimage[rownum][colnum+1] = 1
          end
          @newimage[rownum][colnum] = 1
        else
          if @newimage[rownum][colnum] != 1
            @newimage[rownum][colnum] = 0
          end
        end
        colnum += 1
      end
      rownum += 1
    end
  end

  def output_blur
     @newimage.each do |row|
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
image.blur_image
puts "original"
image.output_image
puts "blurred"
image.output_blur