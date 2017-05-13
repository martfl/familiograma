// Update the HTML elements for editing the properties of the currently selected node, if any
function updateProperties(data) {
	if (data === null) {
		document.getElementById("propertiesPanel").style.display = "none";
		document.getElementById("nombre").value = "";
		document.getElementById("edad").value = "";
	} else {
		document.getElementById("propertiesPanel").style.display = "block";
		document.getElementById("nombre").value = data.n || "";
		document.getElementById("edad").value = data.e || "";
		document.getElementById("ocupacion").value = data.ocupacion || "";
		document.getElementById("estadoCivil").value = data.estadoCivil || "";
		document.getElementById("escolaridad").value = data.escolaridad || "";
		document.getElementById("estadoOcupa").value = data.estadoOcupa || "";
		document.getElementById("religion").value = data.religion || "";
		document.getElementById("telefono").value = data.telefono || "";
		$("input[name=nse][value='" + data.nse + "']").prop("checked", true) || "";
		$("input[name=gender][value='" + data.s + "']").prop("checked", true) || "";
		$("input[name=pacienteFamiliar][value='" + data.pacienteFamiliar + "']").prop("checked", true) || "";
		$("input[name=familiarPaciente][value='" + data.familiarPaciente + "']").prop("checked", true) || "";
		if (data.a !== undefined) {
			if (data.a.indexOf("A") != -1) {
				$("input[name=viveConPaciente]").prop("checked", true);
			} else {
				$("input[name=viveConPaciente]").prop("checked", false);
			}
			if (data.a.indexOf("D") != -1) {
				$("input[name=apoyoEconomico]").prop("checked", true);
			} else {
				$("input[name=apoyoEconomico]").prop("checked", false);
			}
			if (data.a.indexOf("S") != -1) {
				$("input[name=finado]").prop("checked", true);
			} else {
				$("input[name=finado]").prop("checked", false);
			}
			if (data.a.indexOf("L") != -1) {
				$("input[name=cuidador]").prop("checked", true);
			} else {
				$("input[name=cuidador]").prop("checked", false);
			}
		} else {
			$("input[name=viveConPaciente]").prop("checked", false);
			$("input[name=apoyoEconomico]").prop("checked", false);
			$("input[name=finado]").prop("checked", false);
			$("input[name=cuidador]").prop("checked", false);
		}
	}
}

function onSelectionChanged(e) {
	var node = e.diagram.selection.first();
	if (node instanceof go.Node) {
		updateProperties(node.data);
	} else {
		updateProperties(null);
	}
}


// This is called when the user has finished inline text-editing
function onTextEdited(e) {
	var tb = e.subject;
	if (tb === null || !tb.name) return;
	var node = tb.part;
	if (node instanceof go.Node) {
		updateData(tb.text, tb.name);
		updateProperties(node.data);
	}
}

// Update the data fields when the text is changed
function updateData(text, field) {
	var node = myDiagram.selection.first();
	// maxSelectionCount = 1, so there can only be one Part in this collection
	var data = node.data;

	if (node instanceof go.Node && data !== null) {
		var model = myDiagram.model;
		model.startTransaction("modified " + field);
		if (field === "n") {
			model.setDataProperty(data, "n", text);
		} else if (field === "s") {
			model.setDataProperty(data, "s", text);
		} else if (field === "e") {
			model.setDataProperty(data, "e", text);
		} else if (field === "ocupacion") {
			model.setDataProperty(data, "ocupacion", text);
		} else if (field === "nse") {
			model.setDataProperty(data, "nse", text);
		} else if (field === "estadoCivil") {
			model.setDataProperty(data, "estadoCivil", text);
		} else if (field === "escolaridad") {
			model.setDataProperty(data, "escolaridad", text);
		} else if (field === "religion") {
			model.setDataProperty(data, "religion", text);
		} else if (field === "telefono") {
			model.setDataProperty(data, "telefono", text);
		} else if (field === "estadoOcupa") {
			model.setDataProperty(data, "estadoOcupa", text);
		} else if (field === "pacienteFamiliar") {
			model.setDataProperty(data, "pacienteFamiliar", text);
		} else if (field === "familiarPaciente") {
			model.setDataProperty(data, "familiarPaciente", text);
		} else if (field === "a") {
			if (data.a === undefined) {
				model.setDataProperty(data, "a", [])
			}

			if (text === "vive") {
				if ($('input[name="viveConPaciente"]:checked').length > 0) {
					var opts = data.a;
					opts = opts.concat(["A"]);
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				} else if ($('input[name="viveConPaciente"]:checked').length === 0) {
					var opts = data.a;
					var index = opts.indexOf("A");
					//console.log(index);
					opts = removeFromOpts(opts, index);
					opts = opts.concat([""]);
					opts.pop();
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				}
			} else if (text === "economico") {
				if ($('input[name="apoyoEconomico"]:checked').length > 0) {
					var opts = data.a;
					opts = opts.concat(["D"]);
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				} else if ($('input[name="apoyoEconomico"]:checked').length === 0) {
					var opts = data.a;
					var index = opts.indexOf("D");
					console.log(index);
					opts = removeFromOpts(opts, index);
					opts = opts.concat([""]);
					opts.pop();
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				}
			} else if (text === "finado") {
				if ($('input[name="finado"]:checked').length > 0) {
					var opts = data.a;
					opts = opts.concat(["S"]);
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				} else if ($('input[name="finado"]:checked').length === 0) {
					var opts = data.a;
					var index = opts.indexOf("S");
					console.log(index);
					opts = removeFromOpts(opts, index);
					opts = opts.concat([""]);
					opts.pop();
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				}
			} else if (text === "cuidador") {
				if ($('input[name="cuidador"]:checked').length > 0) {
					var opts = data.a;
					opts = opts.concat(["L"]);
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				} else if ($('input[name="cuidador"]:checked').length === 0) {
					var opts = data.a;
					var index = opts.indexOf("L");
					console.log(index);
					opts = removeFromOpts(opts, index);
					opts = opts.concat([""]);
					opts.pop();
					model.setDataProperty(data, "a", opts);
					//console.log(opts);
				}
			}
		}
		updateTable(myDiagram);
		model.commitTransaction("modified " + field);
	}
}

function removeFromOpts(opts, index) {
	opts.splice(index, 1);
	return opts;
}

$("#agregarfam").click(function () {
	var a = [];

	if($('input[name=viven2]').is(':checked')){
		a=a.concat(["A"]);
	}
	if($('input[name=economico2]').is(':checked')){
		a=a.concat(["D"]);
	}
	if($('input[name=finado2]').is(':checked')){
		a=a.concat(["S"]);
	}
	if($('input[name=cuidador2]').is(':checked')){
		a=a.concat(["L"]);
	}
    var e = parseInt($("#edad2").val());
    var n = $("#nombre2").val();
	if(n.length>0 && $("#edad2").val().length>0 && (!isNaN(e))){

	agregarFamiliar(myDiagram, {
		'name': $("#nombre2").val(),
		'edad': $("#edad2").val(),
		'sexo': $('input[name=gender2]:checked').val(),
		'relacion': $('input[name=relacion2]:checked').val(),
		'nse': $('input[name=nse2]:checked').val(),
		'telefono': $('#telefono2').val(),
		'estadoCivil': $('input[name=estadoCivil2]:checked').val(),
		'pacienteFamiliar': $('input[name=pacienteFamiliar2]:checked').val(),
		'familiarPaciente': $('input[name=familiarPaciente2]:checked').val(),
		'escolaridad': $('select[name=escolaridad2]').val(),
		'religion': $('select[name=religion2]').val(),
		'ocupacion': $("#ocupacion2").val(),
		'estadoOcupa': $('select[id=estadoOcupa2]').val(),
		'a' : a
	});
	}
});

function agregarFamiliar(diagram, options) {
	//console.log(options);
	var person = diagram.selection.first();
	if (person === null) return;
	diagram.startTransaction("add relative");
	var model = myDiagram.model;
	var node = {
		n: options.name,
		e: options.edad,
		s: options.sexo,
		relacion: options.relacion,
		nse: options.nse,
		telefono: options.telefono,
		cuidador: options.cuidador,
		estadoCivil: options.estadoCivil,
		pacienteFamiliar: options.pacienteFamiliar,
		familiarPaciente: options.familiarPaciente,
		escolaridad: options.escolaridad,
		religion: options.religion,
		ocupacion: options.ocupacion,
		estadoOcupa: options.estadoOcupa,
		a: options.a
	}
	if (options.relacion == "conyuge") {
		model.addNodeData(node);
		var mlab = {
			s: "LinkLabel"
		};
		if (node.s == "M") {
			node.ux = person.data.key;
			person.data.vir = node.key
		} else {
			node.vir = person.data.key;
			person.data.ux = node.key
		}
		model.addNodeData(mlab);
		var mdata = {
			from: person.data.key,
			to: node.key,
			labelKeys: [mlab.key],
			category: "Marriage"
		};
		model.addLinkData(mdata);
	} else if (options.relacion == "hijo") {
		var marriage = [];
		myDiagram.selection.each(function (part) {
			marriage.push(part.data.key);
		});
		if (marriage.length > 2) {
			alert("Más de 2 familiares seleccionados");
			return;
		}
		if (marriage.length == 1) {
			alert("Selecciona 2 familiares, por favor")
			return;
		}
		var link = findMarriage(diagram, marriage[0], marriage[1]);
		if (link != null) {
			if (marriage[0].s == 'M') {
				node.m = marriage[0];
				node.f = marriage[1];
			} else {
				node.f = marriage[0];
				node.m = marriage[1];
			}
			model.addNodeData(node);
			var cdata = {
				from: link.data.labelKeys[0],
				to: node.key
			};
			model.addLinkData(cdata);
		} else {
			alert("Matrimonio no encontrado");
		}
	} else if (options.relacion == "srelacion") {
		model.addNodeData(node);
	}
	updateTable(diagram);
	document.getElementById("nombre2").value = "";
	document.getElementById("edad2").value = "";
	document.getElementById("telefono2").value = "";
	document.getElementById("ocupacion2").value = "";
	document.getElementById("escolaridad2").value = "";
	document.getElementById("estadoOcupa2").value = "";
	document.getElementById("religion2").value = "";

	$("input[name=viven2]").prop("checked", false);
	$("input[name=economico2]").prop("checked", false);
	$("input[name=finado2]").prop("checked", false);
	$("input[name=cuidador2]").prop("checked", false);
	diagram.commitTransaction("add relative");
}

// n: name, s: sex, m: mother, f: father, ux: wife, vir: husband, a: attributes/markers
function agregarPadres(diagram) {
	var person = diagram.selection.first();
	if (person === null) return; // no one is selected
	if (findParentsMarriage(diagram, person.data.key) !== null) { // already has parents
		alert(person.data.n + " ya tiene padres");
		return;
	}
	diagram.startTransaction("add parents");
	var model = myDiagram.model;
	// add a mother
	var mom = {
		n: "New Mother",
		s: "F",
		e: "",
		a: []
	};
	model.addNodeData(mom);
	// add a father
	var dad = {
		n: "New Father",
		s: "M",
		e: "",
		ux: mom.key
	};
	model.addNodeData(dad);
	// add a label node for the marriage link
	var mlab = {
		s: "LinkLabel"
	};
	model.addNodeData(mlab);
	// add the marriage link itself, referring to the parents' keys, and also referring to the label node
	var mdata = {
		from: mom.key,
		to: dad.key,
		labelKeys: [mlab.key],
		category: "Marriage"
	};

	model.addLinkData(mdata);
	// add child link
	var cdata = {
		from: mlab.key,
		to: person.data.key
	};
	person.data.f = dad.key;
	person.data.m = mom.key;
	model.addLinkData(cdata);
	updateTable(diagram);
	diagram.commitTransaction("add parents");
}

function findParentsMarriage(diagram, a) { // A is a node key
	var node = diagram.findNodeForKey(a);
	if (node !== null) {
		var it = node.findLinksInto();
		while (it.next()) {
			var link = it.value;
			if (link.data.category === "Marriage") continue;
			var labelnode = link.fromNode; // the label node for the marriage relationship
			return labelnode.labeledLink; // return the Marriage link
		}
	}
	return null;
}

function borrarNodo(diagram) {

	var person = diagram.selection.first();
	if (person === null) return;
	var model = diagram.model;
	console.log(person.data.key);
	diagram.startTransaction("delete Node");
	if (person.isTreeLeaf&&person.data.key!==0) {
		diagram.remove(person);
		document.getElementById("nombre").value = "";
		document.getElementById("edad").value = "";
		document.getElementById("ocupacion").value = "";
		document.getElementById("estadoCivil").value = "";
		document.getElementById("escolaridad").value ="";
		document.getElementById("religion").value = "";
		document.getElementById("telefono").value = "";
		document.getElementById("estadoOcupa").value = "";
		$("input[name=viveConPaciente]").prop("checked", false);
		$("input[name=apoyoEconomico]").prop("checked", false);
		$("input[name=finado]").prop("checked", false);
		$("input[name=cuidador]").prop("checked", false);
	} else {
		alert(person.data.n + " no puede ser borrado.");
	}
	updateTable(diagram);
	diagram.commitTransaction("delete Node");
}

function myCallback(blob) {
	var url = window.URL.createObjectURL(blob);
	var filename = "familiograma.png";
	var a = document.createElement("a");
	a.style = "display: none";
	a.href = url;
	a.download = filename;
	// IE 11
	if (window.navigator.msSaveBlob !== undefined) {
		window.navigator.msSaveBlob(blob, filename);
		return;
	}
	document.body.appendChild(a);
	requestAnimationFrame(function () {
		a.click();
		window.URL.revokeObjectURL(url);
		document.body.removeChild(a);
	});
}

function makeBlob(myDiagram) {
	var blob = myDiagram.makeImageData({
		background: "white",
		returnType: "blob",
		callback: myCallback
	});
}

function updateTable(diagram) {
	var nodos = diagram.nodes;
	$("#famTable tbody tr").remove();
	while (nodos.next()) {
		var data = nodos.value.data;
		if (data.s !== "LinkLabel") {
			var x = document.getElementById('famTable');
			var new_row = x.rows[1].cloneNode(true);
			var name = new_row.cells[0].getElementsByTagName('p')[0];
			name.innerHTML = nodos.value.data.n || "";
			var age = new_row.cells[1].getElementsByTagName('p')[0];
			age.innerHTML = nodos.value.data.e || "";
			var sex = new_row.cells[2].getElementsByTagName('p')[0];
			sex.innerHTML = nodos.value.data.s || "";
			var nse = new_row.cells[3].getElementsByTagName('p')[0];
			nse.innerHTML = nodos.value.data.nse || "";
			var ec = new_row.cells[4].getElementsByTagName('p')[0];
			ec.innerHTML = nodos.value.data.estadoCivil || "";
			var esc = new_row.cells[5].getElementsByTagName('p')[0];
			esc.innerHTML = nodos.value.data.escolaridad || "";
			var pacFam = new_row.cells[6].getElementsByTagName('p')[0];
			pacFam.innerHTML = nodos.value.data.pacienteFamiliar || "";
			var famPac = new_row.cells[7].getElementsByTagName('p')[0];
			famPac.innerHTML = nodos.value.data.familiarPaciente || "";
			var religion = new_row.cells[8].getElementsByTagName('p')[0];
			religion.innerHTML = nodos.value.data.religion || "";
			var oc = new_row.cells[9].getElementsByTagName('p')[0];
			oc.innerHTML = nodos.value.data.ocupacion || "";
			var estadoOc = new_row.cells[10].getElementsByTagName('p')[0];
			estadoOc.innerHTML = nodos.value.data.estadoOcupa || "";
			var vive = new_row.cells[11].getElementsByTagName('p')[0];
			var economico = new_row.cells[12].getElementsByTagName('p')[0];
			var finado = new_row.cells[13].getElementsByTagName('p')[0];
			var cuida = new_row.cells[14].getElementsByTagName('p')[0];
			var phone = new_row.cells[15].getElementsByTagName('p')[0];
			phone.innerHTML = nodos.value.data.telefono || "";
			if (data.a !== undefined) {
				if (data.a.indexOf("A") !== -1) {
					vive.innerHTML = "<span class=\"glyphicon glyphicon-ok\"></span>";
				}
				if (data.a.indexOf("D") !== -1) {
					economico.innerHTML = "<span class=\"glyphicon glyphicon-ok\"></span>";
				}
				if (data.a.indexOf("S") !== -1) {
					finado.innerHTML = "<span class=\"glyphicon glyphicon-ok\"></span>";
				}
				if (data.a.indexOf("L") !== -1) {
					cuida.innerHTML = "<span class=\"glyphicon glyphicon-ok\"></span>";
				}
			}
			x.getElementsByTagName('tbody')[0].appendChild(new_row);
		}
	}
}


function save(diagram) {
	var jsonData = jQuery.parseJSON(diagram.model.toJson());
	var data = JSON.stringify(jsonData.nodeDataArray);
	console.log("SAVING");
	var data = data.replace(/,*{"s":"LinkLabel","key":-*\d*}/g, "");
	console.log(data);
	var comment = $("#comment").val();
	$.ajax({
		type: 'post',
		url: 'php/saveFile.php',
		data: {
			id: $("#id").val(),
			json: data,
			comment: comment
		},
		success: function(data) {
			console.log("SAVED");
		},
		error: function(data) {
			console.log(data)
		}
	});

}


function setID() {
	var idPaciente = $('#paciente').val();
	if (idPaciente == 0) {
		alert("Por favor selecciona un paciente");
		return;
	}
	$("#id").val(idPaciente);
	$.ajax({
		type: 'post',
		data: {
			id: idPaciente
		},
		dataType: 'json',
		url: 'php/getPatient.php',
		success: function(data) {
			if (data != "") {
				var newFam = "[{\"key\":0,\"n\":\"" + data.nombre + "\",\"e\":\"" + data.edad + "\",\"s\":\"" + data.sexo + "\", \"a\":[\"A\"]}]";
				console.log(newFam);
				$.ajax({
					type: 'post',
					url: 'php/newFile.php',
					data: {
						id: $("#id").val(),
						json: newFam,
						comment: ""
					},
					success: function(data) {
						init();
					}
				});
			} else {
				init();
			}
		},
		error: function(data) {
			console.log(data);
		}
	});
	$('#myModal').modal('hide');
}
