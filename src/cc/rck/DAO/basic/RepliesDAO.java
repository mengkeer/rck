package cc.rck.DAO.basic;

import cc.rck.model.Replies;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Replies entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see cc.rck.model.Replies
 * @author MyEclipse Persistence Tools
 */
public class RepliesDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(RepliesDAO.class);
	// property constants
	public static final String CONTEXT = "context";

	public void save(Replies transientInstance) {
		log.debug("saving Replies instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Replies persistentInstance) {
		log.debug("deleting Replies instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Replies findById(java.lang.Integer id) {
		log.debug("getting Replies instance with id: " + id);
		try {
			Replies instance = (Replies) getSession().get(
					"cc.rck.model.Replies", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Replies instance) {
		log.debug("finding Replies instance by example");
		try {
			List results = getSession().createCriteria("cc.rck.model.Replies")
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
		log.debug("finding Replies instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Replies as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContext(Object context) {
		return findByProperty(CONTEXT, context);
	}

	public List findAll() {
		log.debug("finding all Replies instances");
		try {
			String queryString = "from Replies";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Replies merge(Replies detachedInstance) {
		log.debug("merging Replies instance");
		try {
			Replies result = (Replies) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Replies instance) {
		log.debug("attaching dirty Replies instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Replies instance) {
		log.debug("attaching clean Replies instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}