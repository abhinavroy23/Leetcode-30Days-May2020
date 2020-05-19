import UIKit

/*
 901. Online Stock Span - medium
 
 Write a class StockSpanner which collects daily price quotes for some stock, and returns the span of that stock's price for the current day.

 The span of the stock's price today is defined as the maximum number of consecutive days (starting from today and going backwards) for which the price of the stock was less than or equal to today's price.

 For example, if the price of a stock over the next 7 days were [100, 80, 60, 70, 60, 75, 85], then the stock spans would be [1, 1, 1, 2, 1, 4, 6].

  

 Example 1:

 Input: ["StockSpanner","next","next","next","next","next","next","next"], [[],[100],[80],[60],[70],[60],[75],[85]]
 Output: [null,1,1,1,2,1,4,6]
 Explanation:
 First, S = StockSpanner() is initialized.  Then:
 S.next(100) is called and returns 1,
 S.next(80) is called and returns 1,
 S.next(60) is called and returns 1,
 S.next(70) is called and returns 2,
 S.next(60) is called and returns 1,
 S.next(75) is called and returns 4,
 S.next(85) is called and returns 6.

 Note that (for example) S.next(75) returned 4, because the last 4 prices
 (including today's price of 75) were less than or equal to today's price.
 
 */


class StockSpanner {
    private var stocks : [(Int,Int)]

    init() {
        stocks = [(Int,Int)]()
    }
    
    func next(_ price: Int) -> Int {
        guard stocks.count > 0 else{
            stocks.append((price,1))
            return 1
        }
        
        var count : Int = 1
        var i : Int = stocks.count-1
        while i >= 0{
            //print(stocks)
            let stock = stocks[i]
            if stock.0 > price{
                break
            }
            
            count += stock.1
            i -= stock.1
        }
        stocks.append((price,count))
        return count
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
