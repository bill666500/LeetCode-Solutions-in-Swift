/*

https://leetcode.com/problems/next-permutation/

#31 Next Permutation 

Level: medium

Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place, do not allocate extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1

Inspired by @yuyibestman at https://leetcode.com/discuss/8472/share-my-o-n-time-solution

*/

import Foundation

class Medium_031_Next_Permutation {
    class func swap(inout # nums: [Int], i: Int, j: Int) {
        var tmp: Int
        tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
    class func reverseInPlace(inout # nums: [Int], start: Int, end: Int) {
        if start > end {
            return
        }
        for var i = start; i < (start + end)/2; i++ {
            swap(nums: &nums, i: i, j: start + end - i)
        }
    }
    class func nextPermutation(inout nums: [Int]) {
        var length: Int = count(nums)
        if length < 2 {
            return
        }
        var index: Int = length - 1
        while index > 0 {
            if nums[index - 1] < nums[index] {
                break
            }
            index--
        }
        if index == 0 {
            reverseInPlace(nums: &nums, start: 0, end: length - 1)
        } else {
            var value: Int = nums[index - 1]
            var i: Int = length - 1
            while i >= index {
                if nums[i] > value {
                    break
                }
                i--
            }
            swap(nums: &nums, i: i, j: index - 1)
            reverseInPlace(nums: &nums, start: index, end: length - 1)
        }
    }
}