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

  # sorts issues by how severe they are
  define_singleton_method :sort_issues_by_severity do |issues|
    very_important = []
    important = []
    not_important = []
    result = []
    issues.each do |issue|
      if issue.severity == "Very Important"
        very_important.push(issue)
      elsif issue.severity == "Important"
        important.push(issue)
      elsif issue.severity == "Not Important"
        not_important.push(issue)
      end
    end

    return very_important | important | not_important
  end


  # converts timestamps time to something usually read
  define_singleton_method :convert_to_readable_time do |long_time|
    long_time_string = long_time.to_s
    year = long_time_string.slice(0, 4)
    month = long_time_string.slice(5..6)
    day = long_time_string.slice(8..9)

    hour = long_time_string.slice(11..12).to_i
    minute = long_time_string.slice(14..15)
    second = long_time_string.slice(17..18)

    ampm = false
    if hour > 13
      hour -= 12
      ampm = true
    end

    #get user timezone
    timezone = Time.now.to_s
    timezone = timezone.slice(20..25)
    subract_zone = ""
    split_zone = timezone.split('')
    split_zone.each do |s|
      if s != '0'
        subract_zone += s
      end
    end

    #offet to fit users time zone (+= cause zones can be negative)
    hour += subract_zone.to_i

    date = month + "/" + day + "/" + year
    time = hour.to_s + ":" + minute + ":" + second

    morn_night = (ampm) ? "PM" : "AM"
    return date + " - " + time + morn_night
  end
end
