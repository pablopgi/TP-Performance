package unq.tpi.persistencia.performanceEj.servicios

import java.util.Comparator
import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO
import unq.tpi.persistencia.performanceEj.model.Employee

class ListadoMaximosSalarios extends AbstractListado {

	new(String fileName) {
		super(fileName)
	}

	override def doListado() throws Exception {
		// Trae todos los empleados y los ordena descendientemente por sueldo
		val empleados = new EmployeeDAO().getAll()
//		empleados.sort(new Comparator<Employee>() {
//			override def compare(Employee o1, Employee o2) {
//				o2.salary.compareTo(o1.salary)
//			}

//Necesito ordernar los salarios por fecha y cantidad, para luego obtener los empleados 
//poseedores de esos salarios		

		// Imprime el sueldo de los 10 primeros empleados en la coleccion		
		addColumn("Nombre").addColumn("Sueldo").newLine()
		(0..9).forEach[
			val e = empleados.get(it)
			addColumn(e.fullName).addColumn(e.salary).newLine()
		]
	}
}
