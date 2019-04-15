package www.cmj.goods.user.service;

/**
 * 用户业务异常
 */
public class UserException extends Exception {

	public UserException() {
		super();
	}

	public UserException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserException(String message) {
		super(message);
	}

	public UserException(Throwable cause) {
		super(cause);
	}
}
