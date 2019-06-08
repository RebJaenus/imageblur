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

  def blur_image(distance)
   distance = distance.to_i
   @newimage = Array.new
    if distance > 0
      @image.length.times do |row|
        @newimage[row] = Array.new
        @image[row].length.times do |col|
          @newimage[row][col] = 0
        end
      end
    else
      @image.length.times do |row|
        @newimage[row] = Array.new
        @image[row].length.times do |col|
          if @image[row][col] == 1
            @newimage[row][col] = 1
          else
            @newimage[row][col] = 0
          end
        end
      end
      return
    end

    rownum = 0
    puts @newimage.inspect
    @image.each do |row|
      colnum = 0
      row.each do |col|
        if col == 1
          @newimage[rownum][colnum] = 1
          blur_spot(rownum, colnum, distance)
       end
        colnum += 1
      end
      rownum += 1
    end
  end

  def blur_spot(row, col, distance)
    if row > 0
      @newimage[row-1][col] = 1
    end
    if row < @image.length - 1
      @newimage[row+1][col] = 1
    end
    if col > 0
      @newimage[row][col-1] = 1
    end
    if col < @image[row].length - 1
      @newimage[row][col+1] = 1
    end
    if distance > 1
      if row > 0 
        blur_spot(row-1, col, distance-1)
      end
      if row < @image.length - 1
        blur_spot(row+1, col, distance-1)
      end
      if col > 0
        blur_spot(row, col-1, distance-1)
      end
      if col < @image[row].length - 1
        blur_spot(row, col+1, distance-1)
      end
    else
      return
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
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts "Enter Manhattan Distance"
distance = gets.chomp
image.blur_image(distance)
puts "original"
image.output_image
puts "blurred"
image.output_blur