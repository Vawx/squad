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

  # limits a string to x characters + 3 "..."
  define_singleton_method :limit_chars do |word, limit|
    result = ""
    split = word.split('')
    count = 0
    split.each do |c|
      if count < limit
        result += c
      end
      count += 1
    end
    result += "..."
    return result
  end
end
