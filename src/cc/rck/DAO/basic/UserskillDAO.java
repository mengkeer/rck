package cc.rck.DAO.basic;

import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Userskill;

import java.util.List;

import javax.transaction.Transaction;
//import javax.websocket.Session;

import org.hibernate.Hibernate;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Userskill entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see cc.rck.model.Userskill
 * @author MyEclipse Persistence Tools
 */
public class UserskillDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(UserskillDAO.class);
	// property constants
	public static final String TYPE = "type";

	public void save(Userskill transientInstance) {
		log.debug("saving Userskill instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Userskill persistentInstance) {
		log.debug("deleting Userskill instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Userskill findById(java.lang.Integer id) {
		log.debug("getting Userskill instance with id: " + id);
		try {
			Userskill instance = (Userskill) getSession().get(
					"cc.rck.model.Userskill", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Userskill instance) {
		log.debug("finding Userskill instance by example");
		try {
			List results = getSession()
					.createCriteria("cc.rck.model.Userskill")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Userskill instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Userskill as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			List <Userskill> myskills = (List <Userskill> )queryObject.list();
			return myskills;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findAll() {
		log.debug("finding all Userskill instances");
		try {
			String queryString = "from Userskill";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Userskill merge(Userskill detachedInstance) {
		log.debug("merging Userskill instance");
		try {
			Userskill result = (Userskill) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Userskill instance) {
		log.debug("attaching dirty Userskill instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Userskill instance) {
		log.debug("attaching clean Userskill instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}