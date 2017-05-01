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
		$("input[name=gender][value='" + data.s + "']").prop("checked", true) || "";
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
		}
		model.commitTransaction("modified " + field);
	}
}

function agregarFamiliar(diagram, options) {
	var person = diagram.selection.first();
	if (person === null) return;
	diagram.startTransaction("add relative");
	var model = myDiagram.model;
	var node = {
		n: options.name,
		e: options.edad,
		s: options.sexo
	}
	if (options.relacion == "conyuge") {
		model.addNodeData(node);
		var mlab = {
			s: "LinkLabel"
		};
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
			model.addNodeData(node);
			var cdata = {
				from: link.data.labelKeys[0],
				to: node.key
			};
			model.addLinkData(cdata);
		} else {
			alert("Matrimonio no encontrado");
		}
	}
	diagram.commitTransaction("add relative");
}


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
		a: ["A"]
	};
	model.addNodeData(mom);
	// add a father
	var dad = {
		n: "New Father",
		s: "M",
		e: "",
		a: ["B"]
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
	model.addLinkData(cdata);
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
	diagram.startTransaction("delete Node");
	if (person.isTreeLeaf) {
		diagram.remove(person);
	} else {
		alert(person.data.n + " no puede ser borrado.");
	}
	diagram.commitTransaction("delete Node");
}