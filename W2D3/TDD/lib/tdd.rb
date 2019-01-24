class Array
    def my_uniq
        results = []
        self.each do |el|
            results << el unless results.include?(el)
        end
        results
    end

    def two_sum 
        results = []
        self.each.with_index do |el1, idx1|
            self.each.with_index do |el2, idx2|
                if idx1 < idx2 && el1 + el2 == 0
                    results << [idx1, idx2]
                end
            end
        end
        return nil if results.length == 0 
        results
    end

    def my_transpose
        results = Array.new(self.length) { [] }
        self.each do |subarray|
            subarray.each.with_index do |el, idx|
                results[idx] << el
            end
        end
        results
    end
end

def stock_picker(array)
    results = []
    min = [1.0/0.0, 0]
    max = [-1.0/0.0, 0]
    array.each.with_index do |el, idx|
        min = [el, idx] if el <= min.first
        max = [el, idx] if el >= max.first && idx > min.last
    end
    results += [min.last, max.last]
    results
end
