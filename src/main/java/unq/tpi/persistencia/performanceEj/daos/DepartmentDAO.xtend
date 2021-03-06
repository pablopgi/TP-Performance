package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}
	
	def getByCodeAndSalaries(String num){
		val session = SessionManager.getSession()
		session.createQuery("from Department d 
							 join fetch d.employees e 
							 join fetch e.salaries s
							 join fetch e.titles t
							 where d.code = :code")
				.setParameter("code", num).list() as List<Department>
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}

}
