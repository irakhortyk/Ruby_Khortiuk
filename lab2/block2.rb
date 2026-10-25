def matrix_min_loop(matrix)
  raise ArgumentError if matrix.empty? || matrix[0].empty?

  min_val = matrix[0][0]
  for r in 0...matrix.length
    for c in 0...matrix[r].length
      min_val = matrix[r][c] if matrix[r][c] < min_val
    end
  end
  min_val
end

def matrix_min_iterator(matrix)
  matrix.flatten.min
end

def product_positive_loop(matrix)
  product = 1
  found = false
  r = 0

  while r < matrix.length
    c = 0
    while c < matrix[r].length
      if matrix[r][c] > 0
        product *= matrix[r][c]
        found = true
      end
      c += 1
    end
    r += 1
  end

  found ? product : 0
end

def product_positive_iterator(matrix)
  positives = matrix.flatten.select(&:positive?)
  positives.empty? ? 0 : positives.reduce(:*)
end

mat = [
  [14, -2, 7],
  [-3, 18, 0],
  [5, -9, 2]
]

puts matrix_min_loop(mat)
puts matrix_min_iterator(mat)
puts product_positive_loop(mat)
puts product_positive_iterator(mat)