<h2>586. Customer Placing the Largest Number of Orders</h2><h3>Easy</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__3Su4"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Query the <b>customer_number</b> from the <b><i>orders</i></b> table for the customer who has placed the largest number of orders.</p>

<p>It is guaranteed that exactly one customer will have placed more orders than any other customer.</p>

<p>The <b><i>orders</i></b> table is defined as follows:</p>

<pre>| Column            | Type      |
|-------------------|-----------|
| order_number (PK) | int       |
| customer_number   | int       |
| order_date        | date      |
| required_date     | date      |
| shipped_date      | date      |
| status            | char(15)  |
| comment           | char(200) |
</pre>

<p><b>Sample Input</b></p>

<pre>| order_number | customer_number | order_date | required_date | shipped_date | status | comment |
|--------------|-----------------|------------|---------------|--------------|--------|---------|
| 1            | 1               | 2017-04-09 | 2017-04-13    | 2017-04-12   | Closed |         |
| 2            | 2               | 2017-04-15 | 2017-04-20    | 2017-04-18   | Closed |         |
| 3            | 3               | 2017-04-16 | 2017-04-25    | 2017-04-20   | Closed |         |
| 4            | 3               | 2017-04-18 | 2017-04-28    | 2017-04-25   | Closed |         |
</pre>

<p><b>Sample Output</b></p>

<pre>| customer_number |
|-----------------|
| 3               |
</pre>

<p><b>Explanation</b></p>

<pre>The customer with number '3' has two orders, which is greater than either customer '1' or '2' because each of them  only has one order. 
So the result is customer_number '3'.
</pre>

<p><i><b>Follow up:</b> What if more than one customer have the largest number of orders, can you find all the customer_number in this case?</i></p>
</div>