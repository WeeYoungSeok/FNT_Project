<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://d3js.org/d3.v3.js"></script>
</head>
<body>

	<div id="buypie"></div>
	
	<script type="text/javascript">

		var width = 300, 
			height = 300, 
			outerRadius = Math.min(width, height) / 2, 
			innerRadius = outerRadius * .5, 
			color = d3.scale.category20();
		
		var dataset = [
			{name:"패션", value:0}, 
			{name:"차량", value:0}, 
			{name:"가전제품", value:0}, 
			{name:"반려동물", value:0}, 
			{name:"스포츠", value:0}];
		var vis = d3.select("#buypie")
			.append("svg:svg")
			.attr("width", width)
			.attr("height", height)
			.append("svg:g")
			.attr("transform", "translate(" + outerRadius + "," + outerRadius + ")")
			.data([dataset]);
		
		var arc = d3.svg.arc().innerRadius(innerRadius).outerRadius(outerRadius);
		
		var pie = d3.layout.pie().value(function(d) { return d.value; });
		
		var arcs = vis.selectAll("g.slice")
			.data(pie)
			.enter()
			.append("svg:g")
			.attr("class", "slice");
		
		arcs.append("svg:path")
			.attr("d", arc)
			.attr("fill", function(d, i) { return color(i); });
		
		arcs.append("svg:text")
			.attr("dy", ".25em")
			.attr("text-anchor", "middle")
			.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + angle(d) + ")"; })
			.text(function(d) { return d.data.name; });
		
		function angle(d) {
			var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
			return a > 90 ? a - 180 : a;
		}
		
		vis.append("svg:text")
			.attr("dy", ".25em")
			.attr("text-anchor", "middle")
			.text("카테고리별\n구매글 비율")
			.attr("class", "title");

	</script>

</body>
</html>