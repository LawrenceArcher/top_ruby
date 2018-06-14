def bubble_sort(arr)
	changed_order = false
	arr.each_with_index do |x,index|
		unless index == arr.length-1
			if arr[index] > arr[index+1]
				arr[index], arr[index+1] = arr[index+1], arr[index]
				changed_order = true
			end
		end
	end
	if changed_order == false
		print "#{arr}\n"
		return
	else
		bubble_sort(arr)
	end
end

bubble_sort([2, 4, 9, 6, 7, 3, 11, 2])

def bubble_sort_by(arr)
	changed_order = false
	arr.each_with_index do |x,index|
		unless index == arr.length-1
			if arr[index] > arr[index+1]
				z = yield(arr[index], arr[index+1])
				if z == 1 
					arr[index], arr[index+1] = arr[index+1], arr[index]
				end
				changed_order = true
			end
		end
	end
	if changed_order == false
		print "#{arr}\n"
		return
	else
		bubble_sort(arr)
	end
end

bubble_sort_by([2, 4, 9, 6, 7, 3, 11, 2]){|x,y| x <=> y}