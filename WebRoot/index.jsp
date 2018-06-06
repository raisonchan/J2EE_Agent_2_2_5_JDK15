<%@ page language="java" pageEncoding="GBK"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="cn.com.jit.assp.ias.sp.saml11.SPUtil"%>
<%@ page import="cn.com.jit.assp.ias.sp.saml11.SPConst"%>
<%@ page import="cn.com.jit.assp.ias.saml.saml11.*"%>
<%@ page
	import="cn.com.jit.assp.ias.saml.saml11.SAMLAttributes.SAMLAttributeName"%>
<%@ page import="cn.com.jit.assp.ias.principal.UserPrincipal"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.jit.cinas.commons.util.StringUtils"%>
<%
	boolean success = false;
	UserPrincipal p = null;
	SimpleDateFormat formatter = new SimpleDateFormat(
			"yyyy��MM��dd�� HH:mm:ss");

	p = SPUtil.getUserPrincipal(request);	

	success = (p == null ? false : true);
%>
<%!String format(String str) {
		int len = str.length();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			sb.append(str.charAt(i));
			if (i % 76 == 0 && i != 0) {
				sb.append("<br>");
			}
		}
		return sb.toString();
	}

	boolean isNull(String str) {
		return (str == null || str.trim().equals(""));
	}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��֤���</title>
<link href="images/body.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0">
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td valign="top" align="center">
		<table width="100%" height="119" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="47%"><img src="images/testtop.gif" width="570"></td>
				<td width="53%" valign="top" background="images/topall_42.gif">
				<div align="right"><img src="images/topall_43.gif" width="187"
					height="60"></div>
				</td>
			</tr>
		</table>
		<table width="780" height="5" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td background="images/bodylist_top1.gif" align="right">
				<table width="753" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right"><img src="images/bodylist_top2.gif"></td>
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
						<td class="listmenutxt" colspan="4">���</td>
					</tr>
					<tr class="listtxt">
						<td width="20%">��֤�Ƿ�ͨ����</td>
						<td width="80%" colspan="3"><%=success ? " �ɹ�" : "ʧ��"%></td>
					</tr>
					<%
					if (success) {
					%>
					<%
					String tokenId=(String)p.getAttribute(SPConst.KEY_SAML_ATTR_ID);
					if(!isNull(tokenId)){
					%>
					<tr class="listtxt">
						<td width="20%">����ID��</td>
						<td width="80%" colspan="3"><%=tokenId%></td>
					</tr>
					<%}%>
					<%
					String username=p.getName();
					if (!isNull(username)) {
					%>
					<tr class="listtxt">
						<td width="20%">�û�ID��</td>
						<td width="80%" colspan="3"><%=username%></td>
					</tr>
					<%}	%>
					<%
					String format=(String)p.getAttribute(SPConst.KEY_SAML_ATTR_SUBJECT_FORMAT);
					if (!isNull(format)) {
					%>
					<tr class="listtxt">
						<td width="20%">�û�ID��ʽ��</td>
						<td width="80%" colspan="3"><%=format%></td>
					</tr>
					<%}%>
					<%
					String issuer=(String)p.getAttribute(SPConst.KEY_SAML_ATTR_ISSUER);
					if (!isNull(issuer)) {
					%>
					<tr class="listtxt">
						<td width="20%">��֤��������</td>
						<td width="80%" colspan="3"><%=issuer%></td>
					</tr>
					<%}%>
					<%
					Date instant=(Date)p.getAttribute(SPConst.KEY_SAML_ATTR_ISSUER_INSTANT);
					if ( instant!= null) {
					%>
					<tr class="listtxt">
						<td width="20%">��֤���ǩ��ʱ�䣺</td>
						<td width="80%" colspan="3"><%=formatter.format(instant)%></td>
					</tr>
					<%}	%>
					<%
					String method=(String)p.getAttribute(SPConst.KEY_SAML_ATTR_STATEMENT_AUTHN_MEHTOD);
					if (!isNull(method)) {
					%>
					<tr class="listtxt">
						<td width="20%">��֤������</td>
						<td width="80%" colspan="3"><%=method%></td>
					</tr>
					<%}%>
					<%
					Date authn_instant=(Date)p.getAttribute(SPConst.KEY_SAML_ATTR_STATEMENT_AUTHN_INSTANT);
					if (authn_instant!=null) {
					%>
					<tr class="listtxt">
						<td width="20%">��¼ʱ�䣺</td>
						<td width="80%" colspan="3"><%=formatter.format(authn_instant)%></td>
					</tr>
					<%}%>
					<%
					Date notBefore=(Date)p.getAttribute(SPConst.KEY_SAML_ATTR_NOT_BEFORE);
					if ( notBefore!= null) {
					%>
					<tr class="listtxt">
						<td width="20%">��֤�����ʼ��Ч�ڣ�</td>
						<td width="80%" colspan="3"><%=formatter.format(notBefore)%></td>
					</tr>
					<%}%>
					<%
					Date notAfter=(Date)p.getAttribute(SPConst.KEY_SAML_ATTR_NOT_ON_OR_AFTER);
					if ( notAfter!= null) {
					%>
					<tr class="listtxt">
						<td width="20%">��֤�����ֹ��Ч�ڣ�</td>
						<td width="80%" colspan="3"><%=formatter.format(notAfter)%></td>
					</tr>
					<%}%>
					<%
					String ip=(String)p.getAttribute(SPConst.KEY_SAML_ATTR_STATEMENT_AUTHN_CLIENT_IP);
					if (!isNull(ip)) {
					%>
					<tr class="listtxt">
						<td width="20%">�û�IP��ַ��</td>
						<td width="80%" colspan="3"><%=ip%></td>
					</tr>
					<%}%>
					<%
					SAMLAttributes attrs = (SAMLAttributes)p.getAttribute(SPConst.KEY_SAML_ATTR_STATEMENT_ATTRIBUTES);
					if (attrs != null) {
						List ls = attrs.getAttributeNames();
						for (int i = 0; i < ls.size(); i++) {
							SAMLAttributeName name = (SAMLAttributeName) ls.get(i);
							// ȡ�ø�����ֵ
							String parentValueName = name.getParentName();
							List values = null;
					%>
					<tr class="listtxt">
						<td>�Զ������ԣ�</td>
						<td colspan="<%
							if(!StringUtils.isBlankOrNull(parentValueName)){
								out.print("1");
							} else {
								out.print("3");
							}
						%>"
						>
						
						��������<%=name.getName()%><br>
						�����ռ䣺<%=name.getNamespace()%><br>
						����ֵ��
						<%
						// ���ݲ�ͬ����ȡ�ò�ͬ��valueList
						if (!StringUtils.isBlankOrNull(parentValueName))
							// ��"�����ֵ�"��������ʱ
							values = attrs.getAttributeValue(name.getName(),name.getNamespace(),parentValueName);
						else
							values = attrs.getAttributeValue(name.getName(),name.getNamespace());
						
						if (values.size() == 1) {
						%>
						<%
							String v=(String) values.get(0);
						%>
						<%= v.length()>76 ? format(v):v %>
						<%} else {
							StringBuffer sb = new StringBuffer();
							sb.append("<br>");
							for (int j = 0; j < values.size(); j++) {
								String v= (String) values.get(j);
								sb.append(v.length() > 76 ? format(v) : v);
								sb.append("<br>");
							}
							String s = sb.toString();
							if (s.endsWith("<br>")) {
								s = s.substring(0,s.lastIndexOf("<br>"));
							}
						%>
						<%=s%>
						<%}%>
						<% 
						// ���parentValueName��Ϊ�ջ��߿��ַ�������չʾ
						if(!StringUtils.isBlankOrNull(parentValueName)){ %>
							</td><td>�ϼ�������</td><td><%=parentValueName %>
						<%}
						%>
						</td>
					</tr>
					<%}}
					}else{
					%>
					<tr class="listtxt">
						<td width="20%">��֤�������Ƿ����ߣ�</td>
						<td width="80%"><%=SPUtil.isOffLine(request)?"��":"��"%></td>
					</tr>
					<%}%>
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
