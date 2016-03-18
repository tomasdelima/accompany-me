class Friend < User
  self.table_name = 'users'

  protected

    def password_integrity
    end
end