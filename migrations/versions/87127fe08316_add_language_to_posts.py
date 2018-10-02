"""add language to posts

Revision ID: 87127fe08316
Revises: 36e5af1a05d6
Create Date: 2018-10-02 14:12:39.248154

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '87127fe08316'
down_revision = '36e5af1a05d6'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('post', sa.Column('language', sa.String(length=5), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('post', 'language')
    # ### end Alembic commands ###
