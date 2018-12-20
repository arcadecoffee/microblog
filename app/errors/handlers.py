from flask import render_template

from app import db
from app.errors import bp


@bp.app_errorhandler(404)
def not_found_error(error):
    return render_template('errors/404.html'), 404


@bp.app_errorhandler(500)
def internal_error(error):
    try:
        db.session.rollback()
    except Exception as ex:
        template = "An exception of type {0} occurred. Arguments\n{1!r}"
        message = template.format(type(ex).__name__, ex.args)
        app.logger.error(message)
    finally:
        return render_template('errors/500.html'), 500
