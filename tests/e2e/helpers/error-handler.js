class TextError extends Error {
  constructor(message, _err, status) {
    super(message);

    Error.captureStackTrace(this, this.constructor);
    this.name = _err || this.constructor.name;
    this.status = status || 403;
  }
};

module.exports = {
  TextError
}
