class CrudService
  
  class << self

    def session_create(email)
      CrudRepository.sesion_create(email)
    end


    def index
      CrudRepository.index
    end

    def new
      CrudRepository.new
    end

    def create(user)
      isSave = CrudRepository.create(user)
    end

    def create_user(user)
      @user = CrudRepository.create_user(user)
    end

    def set_user(id)
      @user = CrudRepository.find_by_id(id)
    end

    def update(id,user_form)
      @user = CrudRepository.find_by_id(id)
      isUpdate = CrudRepository.update(@user,user_form)
    end

    def delete(id)
      @user = CrudRepository.find_by_id(id)
      CrudRepository.delete(@user)
    end

  end

end