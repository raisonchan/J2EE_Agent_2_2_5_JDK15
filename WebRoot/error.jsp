<%@ page language="java" pageEncoding="GBK"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="cn.com.jit.assp.ias.saml.saml11.SAMLMessage"%>
<%@ page import="cn.com.jit.assp.ias.sp.saml11.SPConst"%>

<%
	/**/
	String errorCode = null;
	String errorDesc = null;
	String location = null;
	String detail = null;
	SAMLMessage error = (SAMLMessage) request
			.getAttribute(SPConst.KEY_SSO_ATTR_ERROR);
	if (error != null) {
		errorCode = error.getCode();
		errorDesc = error.getMessage();
		location = error.getLocation();
		detail = error.getDetail();
	}

	if (errorCode == null || errorCode.trim().equals("")) {
		errorCode = "δ֪";
	}
	if (errorDesc == null || errorDesc.trim().equals("")) {
		errorDesc = "δ֪��������ϵ����Ա";
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title></title>
<link href="<%= request.getContextPath() %>/images/body.css"
	rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0">

<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td valign="top" align="center">
		<table width="100%" height="119" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="47%"><img
					src="<%= request.getContextPath() %>/images/testtop.gif"
					width="570"></td>
				<td width="53%" valign="top"
					background="<%= request.getContextPath() %>/images/topall_42.gif">
				<div align="right"><img
					src="<%= request.getContextPath() %>/images/topall_43.gif"
					width="187" height="60"></div>
				</td>
			</tr>
		</table>
		<table width="780" height="5" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td
					background="<%= request.getContextPath() %>/images/bodylist_top1.gif"
					align="right">
				<table width="753" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right"><img
							src="<%= request.getContextPath() %>/images/bodylist_top2.gif"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

		<table width="780" border="0" cellpadding="0" cellspacing="0"
			bgcolor="#E4E9E0">
			<tr>
				<td valign="top" align="center"><br>
				<table width="720" border="0" cellpadding="0" cellspacing="1"
					bgcolor="#7D8873">
					<tr>
						<td class="listmenutxt" colspan="2"></td>
					</tr>
					<tr class="listtxt">
						<td width="30%">������Ϣ:</td>
						<td width="70%"><%=errorDesc%></td>
					</tr>
					<tr class="listtxt">
						<td width="30%">�������:</td>
						<td width="70%"><%=errorCode%></td>
					</tr>
					<%
					if (location != null&&(!location.trim().equals(""))) {
					%>
					<tr class="listtxt">
						<td width="30%">����λ��:</td>
						<td width="70%"><%=location%></td>
					</tr>
					<%
					}
					%>
					<%
					if (detail != null&&(!detail.trim().equals(""))) {
					%>
					<tr class="listtxt">
						<td width="30%">��ϸ��Ϣ:</td>
						<td width="70%"><%=detail%></td>
					</tr>
					<%
					}
					%>
				</table>
				<br>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
