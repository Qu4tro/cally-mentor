# Guide

Alright, our goal is to calculate weekdays for a given date. There is a way to derive all of the required math, but this is not the goal here. This is a pragmatic guide on learning on how to run this algorithm in your head.

The final formula we'll end up is:

    (dayCode + monthCode + yearCode + centuryCode) % 7

Simple, right?

To simplify the math you can also mod each term by 7. We'll refer to this as **dropping 7s**, as `% 7` is equivalent to continuously subtracting 7 while the result is greater or equal than 7.
Given this, the following formula is equivalent to the above:

    (dayCode % 7 + monthCode % 7 + yearCode % 7 + centuryCode % 7) % 7

The possible results for the formulas above are the integers between 0 and 6 (inclusive), each mapping to a different weekday:

| Weekday   | Result  |
|-----------|---------|
| Sunday    | 0       |
| Monday    | 1       |
| Tuesday   | 2       |
| Wednesday | 3       |
| Thursday  | 4       |
| Friday    | 5       |
| Saturday  | 6       |


Ok, but how do we calculate each term?

## Day

The `dayCode` is simply the day of the month.

I'm going to cheat a bit and let you know a few codes. The code for this century (20XX) is 0 and so is the code for the month of May and for the year 2000.
Now that we know that, our formula becomes `(dayCode + 0 + 0 + 0) % 7` and we can figure out a few weekdays:

- `May 3rd, 2000`
    - The dayCode is simply 3. The result is already smaller than 7, we don't need to do anything. If we lookup in the table above, that's a Wednesday.
- `May 1st, 2000`
    - The dayCode is 1. That's a Monday.
- `May 21th, 2000`
    - The dayCode is 21. After dropping 7s, we get 0, which is a Sunday.
- `May 28th, 2000`
    - The dayCode is 28. After dropping 7s, we get 0, which is a Sunday.
- `May 20th, 2000`
    - The dayCode is 20. After dropping 7s, we get 6, which is a Saturday.


## Month

The `monthCode` is just a tiny bit more difficult. There's a table for you to memorize. The only _gotcha_ is that the values for January and February decrement by 1 when it's a leap year. Ok, let's see it:

| Month     | monthCode                 |
|-----------|---------------------------|
| January   | 6 if not leap year else 5 |
| February  | 2 if not leap year else 1 |
| March     | 2                         |
| April     | 5                         |
| May       | 0                         |
| June      | 3                         |
| July      | 5                         |
| August    | 1                         |
| September | 4                         |
| October   | 6                         |
| November  | 2                         |
| December  | 4                         |

or grouped and ordered by monthCode:

| Month                                       | monthCode |
|---------------------------------------------|-----------|
| May                                         | 0         |
| August                                      | 1         |
| February (1 in leap years), March, November | 2         |
| June                                        | 3         |
| September, December                         | 4         |
| April, July                                 | 5         |
| January (5 in leap years), October          | 6         |

So, let's see a few examples, still in the year 2000 (which is a leap year).

- `January 1st, 2000`
    - The dayCode is 1 and the monthCode is 5. If we sum them, we get 6. That means, it was a Saturday.
- `May 1st, 2000`
    - The dayCode is 1 and the monthCode is 0. That's a Monday.
- `February 29th, 2000`
    - The dayCode is 1 (after dropping 7s) and so is the monthCode. `1 + 1 == 2`, which means it was a Tuesday.

A few more for you to train on:

- `December 24th, 2000`
- `September 22nd, 2000`
- `June 30th, 2000`
- `August 8th, 2000`
- `July 11th, 2000`
- `April 18th, 2000`
- `June 7th, 2000`

## Year

Let's do the `yearCode`. With it, you can calculate the weekdays for all the dates in the `20XX`s.

Let's define year as the last two digits of the year. So `2021` is just `21`, `2000` is just `00`, etc.

The `yearCode` is just `year + year // 4` . Note that it's an integer division (you can discard the decimal part).  
In intuitive terms, the `yearCode` starts at 0 when the year is `00` and is incremented by 1 on non-leap years and by 2 on leap years. 

Let's try to calculate a few `yearCode`s:

- `2000`
    - The division result is 0, so 0 + 0 == 0.
- `2001`
    - The division result is 0, so 0 + 1 == 1.
- `2010`
    - The division result is 2, so 10 + 2 == 12, which turns into 5 after dropping 7s.
- `2011`
    - The division result is 2, so 11 + 2 == 12, which turns into 6 after dropping 7s.
- `2012`
    - The division result is 3 (it increased on the leap year), so 12 + 3 == 15, which turns into 1 after dropping 7s.
- `2080`
    - The division result is 20. 80 + 20 == 100. Although it's not completely trivial to drop the 7s from 100.
    - Let's drop 70 (7 x 10), to find an easier number: 100 - 70 = 30. Dropping the 7s of 30 is easy, because 28 (7 x 4) is nearby: 30 - 28 = 2.
    - The `yearCode` here is 2.

You can also drop the 7s of each term of the sum separately to help in some harder numbers:

- `2070`
    - Dropping 7's from 70 gives us 0.
    - The division result is 17. 17 + 0 = 17. Drop the 7s to get 3.

One last observation, that is worth mentioning, is that the `yearCode`, for years multiple of 12, is the multiplication factor. That is:
- `2000`
    - 12 * 0, so the `yearCode` is 0
- `2012`
    - 12 * 1, so the `yearCode` is 1
- `2024`
    - 12 * 2, so the `yearCode` is 2
- `2036`
    - 12 * 3, so the `yearCode` is 3
- `2048`
    - 12 * 4, so the `yearCode` is 4
- `2060`
    - 12 * 5, so the `yearCode` is 5
- `2072`
    - 12 * 5, so the `yearCode` is 6
- `2084`
    - 12 * 5, so the `yearCode` is 7
- `2096`
    - 12 * 8, so the `yearCode` is 8, which turns into 1 after dropping 7s.


Before advancing further, you should now be able to do calculate birthdays, holiday dates and even the weekday of today!

So go ahead and train!  
I'll let you know one more secret: The `centuryCode` for `19XX` is 1. You can learn how to calculate the code in the section below, but knowing `20XX` (which is 0) and `19XX` (which is 1), should be enough, as more distant dates appear less often (and their weekday is even less relevant in most cases). So, feel free to skip the next section.

## Century

Ok, we are almost there. 

Let's define century as the first two digits of the year. So `2021` is just `20`, `1932` is just `19`, etc.

The formula is:

    2 * (3 - century % 4) + 1

The values repeat every 4 centuries. The repeating sequence is [0, 5, 3, 1].

Let's see a couple examples: 

- `20XX`
    - 20 is multiple of 4, so the inner term will be `3 - 0 = 3`.
    - `2 * 3 + 1 = 7`
    - 7 is 0 after dropping 7s.
- `21XX`
    - if `20XX` is 0, then `21XX` must be 5. 
- `22XX`
    - if `21XX` is 5, then `22XX` must be 3. 
- `19XX`
    - if `20XX` is 0, we can walk backwards in the sequence to see that `19XX` is indeed 1.
- `18XX`
    - if `19XX` is 1, then `18XX` is 1s 3.


## The End

Hope you've enjoyed. Keep training!