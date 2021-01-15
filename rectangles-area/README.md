<h2>1459. Rectangles Area</h2><h3>Medium</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__3Su4"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code>Points</code></p>

<pre>+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| x_value       | int     |
| y_value       | int     |
+---------------+---------+
id is the primary key for this table.
Each point is represented as a 2D Dimensional (x_value, y_value).</pre>

<p>Write an SQL query to&nbsp;report&nbsp;of all possible rectangles which can be formed by any two points of the table.&nbsp;</p>

<p>Each row in the result contains three columns (p1, p2, area) where:</p>

<ul>
	<li><strong>p1</strong> and <strong>p2</strong> are the id of&nbsp;two opposite corners of a rectangle and p1 &lt; p2.</li>
	<li>Area of this rectangle is represented by the column <strong>area</strong>.</li>
</ul>

<p>Report the query in&nbsp;descending&nbsp;order by area in case of tie in ascending order by p1 and p2.</p>

<pre>Points table:
+----------+-------------+-------------+
| id       | x_value     | y_value     |
+----------+-------------+-------------+
| 1        | 2           | 8           |
| 2        | 4           | 7           |
| 3        | 2           | 10          |
+----------+-------------+-------------+

Result table:
+----------+-------------+-------------+
| p1       | p2          | area        |
+----------+-------------+-------------+
| 2        | 3           | 6           |
| 1        | 2           | 2           |
+----------+-------------+-------------+

p1 should be less than p2 and area greater than 0.
p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.
p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 6.
p1 = 1 and p2 = 3 It's not possible because the rectangle has an area equal to 0.
</pre>
</div>