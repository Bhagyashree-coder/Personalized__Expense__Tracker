   <%@ page import = "com.myproject.DBConnection" %>

<%

        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "select category,sum(amount) from expenses groupby category ";
            PreparedStatement stmt = conObj.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();


%>

<html>
<body>

<h1> Expenses Summary (Category Wise) </h1>

<table>

<tr>
<td>Category</td>
<td>Total Amount</td>
</tr>

<% while(rs.next())
{
%>
  <tr>
  <td> <%= rs.getString(1) %> </td>
  <td> <%= rs.getDouble(2) %> </td>
  </tr>

 <%
}
%>

</table>
</body>
</html>

<%
conObj.close();

 }catch(Exception e)
   {
   e.printStackTrace();
   }

   %>




