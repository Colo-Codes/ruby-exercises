# About benchmarking

In order to test how the two approaches of iterating through the array compare,
I wrote a simple benchmarking test in the `spec/project4_bubble_sort_spec.rb`
file.

The test creates an array of 5000 unsorted numbers, and then runs the bubble
sort method on it.

Comment lines `28` and `29` accordingly to run the test for the two approaches.

The results are as follows:

```bash
# Using (n - 1).times

$ bundle exec rspec --color spec/project4_bubble_sort_spec.rb:26
Run options: include {:locations=>{"./spec/project4_bubble_sort_spec.rb"=>[26]}}
       user     system      total        real
bubble_sort  2.387847   0.009191   2.397038 (  2.397696)

# Using (n - iteration).times

$ bundle exec rspec --color spec/project4_bubble_sort_spec.rb:26
Run options: include {:locations=>{"./spec/project4_bubble_sort_spec.rb"=>[26]}}
       user     system      total        real
bubble_sort  1.682715   0.008039   1.690754 (  1.691269)

# Improvement of 29.5% (0.706427 seconds)
```

The optimised loop using `(n - iteration).times` condition only iterates through
the unsorted part of the array instead of the entire array in each iteration.
