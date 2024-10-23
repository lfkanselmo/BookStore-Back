from typing import Optional

from pydantic import BaseModel

class AuthorSchema(BaseModel):
    id: Optional[int] = None
    name: str
    nationality: str | None = None
    biography: str | None = None

    class Config:
        orm_mode = True