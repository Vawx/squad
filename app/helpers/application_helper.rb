module ApplicationHelper

  # compares User.ID and NOT profile.ID as admin should be user.
  define_method :is_admin? do |who, project|
    return project.admin_id == who.id
  end

  # Any cap in string to lowercase
  define_singleton_method :to_lower do |word|
    split = word.split('')
    result = ""
    split.each do |c|
      result += c.downcase
    end
    return result
  end

end
