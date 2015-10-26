package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee where firstName = :name and lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Employee).list() as List<Employee>
	}
	

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	//aca puedo obtener los 10 empleados con mayores sueldos
	def getPorSalarios() {
		val session = SessionManager.getSession()
		val query = session.createQuery("Select s.employee From Salary s Order By s.amount")
		query.setMaxResults = 10
		query.list as List<Employee>
	}

}
