<h2>618. Students Report By Geography</h2><h3>Hard</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__3Su4"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div>A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table <code>student</code> as below.
<p>&nbsp;</p>

<pre>| name   | continent |
|--------|-----------|
| Jack   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jane   | America   |
</pre>

<p>&nbsp;</p>
<a href="https://en.wikipedia.org/wiki/Pivot_table"> Pivot</a> the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.

<p>&nbsp;</p>
For the sample input, the output is:

<p>&nbsp;</p>

<pre>| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    |      |        |
</pre>

<p>&nbsp;</p>
<b>Follow-up:</b> If it is unknown which continent has the most students, can you write a query to generate the student report?

<p>&nbsp;</p>
</div>