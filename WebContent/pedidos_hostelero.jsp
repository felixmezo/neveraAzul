<%@page import="es.upm.dit.isst.neveraAzul.model.Producto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" media="screen" href="/css/bootstrap.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pedidos</title>
</head>
<%@ include file="cabecera.jsp"%>

<body>
	<section id="nav"> <%@ include
		file="navegacion_hostelero.jsp"%> </section>
	<section id="contenido"> <article> <c:if
		test="${not empty pedidos}">
		<div id="tabla0" class="panel panel-default">
			<div class="panel-heading">Estos son los pedidos que han hecho
				a tu establecimiento y su estado.</div>
			<div class="panel-body">
				<p>
					Te han hecho un total de
					<c:out value="${fn:length(pedidos)}" />
					pedido(s).
				</p>
			</div>
			<table class="table">
				<tr>
					<th>Id Pedido</th>
					<th>Cliente</th>
					<th>Precio</th>
					<th>Estado</th>
					<c:forEach items="${pedidos}" var="pedido1">
						<c:if test="${pedido1.estado=='solicitado'}">
							<th>Aceptar Pedido</th>
						</c:if>
					</c:forEach>
				</tr>
				<c:forEach items="${pedidos}" var="pedido">
					<tr>
						<td><c:out value="${pedido.idPedido}" /></td>
						<td><c:out value="${pedido.cliente.email}" /></td>
					<td><c:out value="${pedido.precioTotal}" /> €</td>
						<td><c:out value="${pedido.estado}" /></td>
						<c:if test="${pedido.estado=='solicitado'}">
							<td><form action="/pedidoshostelero" method="post">
								<button type="submit" class="btn btn-default" 
									name="idPedido" value="${pedido.idPedido}">Aceptar</button>
								</form>
							</td>
						</c:if>
					</tr>
									
				</c:forEach>
			</table>
		</div>
	</c:if> <c:if test="${empty pedidos}">
		<p>Todavía no te han hecho ningún pedido.</p>
	</c:if> </article> </section>

</body>
</html>