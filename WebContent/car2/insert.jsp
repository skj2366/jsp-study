<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/jsp-study/car2/insert_ok.jsp">
	<table border="1">
		<tr>
			<th>모델명</th>
			<td><input type="text" name="ci_name"></td>
		</tr>
		<tr>
			<th>연식</th>
			<td><input type="number" min=1950 max=2019 name="ci_year"></td>
		</tr>
		<tr>
			<th>제조회사</th>
			<td><input type="text" name="ci_vendor"></td>
		</tr>
		<tr>
			<th>기타정보</th>
			<td><input type="text" name="ci_etc"></td>
		</tr>
		<tr>
			<!-- <th></th> -->
			<th></th>
			<td colspan="2" align="center"><button>차량등록</button></td>
		</tr>
	</table>
</form>
</body>
</html>