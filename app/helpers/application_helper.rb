module ApplicationHelper

  # check if user is admin of project
  define_method :is_admin? do |who, project|
    return project.admin_id == who.profile.id
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
    long_time_string = long_time.localtime.to_s

    #slice up the created_at time
    year = long_time_string.slice(0, 4)
    month = long_time_string.slice(5..6)
    day = long_time_string.slice(8..9)
    hour = long_time_string.slice(11..12)
    minute = long_time_string.slice(14..15)
    second = long_time_string.slice(17..18)

    post_hour = hour.to_i

    #convert from "military" time (24 hour time)
    if post_hour > 12
      post_hour -= 12
    end

    ampm = (post_hour > 12) ? "PM" : "AM"

    date = month + "/" + day + "/" + year
    time = post_hour.to_s + ":" + minute + ":" + second + " " + ampm
    return time + " - " + date
  end

  # take rources in db and converts the list(s) into links
  define_singleton_method :convert_resources_to_links do |resources|
    split = resources.split("(+)")
    youtubes = split[0].split("[+]").reject { |y| y.empty? }
    imgurs = split[1].split("[+]").reject { |i| i.empty? }

    youtubes_to_embed = []
    embed_index = -1
    youtubes.each do |youtube|
      if !youtube.include?("embed")
        tube_split = youtube.split('')
        char_count = 0
        tube_split.each do |c|
          if c == "/" && tube_split[char_count - 1] == "m" && tube_split[char_count + 1] == "w"
            embed_index = char_count + 1
          end
          char_count += 1
        end

        if embed_index != -1
          youtubes_to_embed.push(youtube.sub!("watch?v=", "").insert(embed_index, "embed/"))
          embed_index = -1
        end
      end
    end
    return youtubes, imgurs
  end

  # check if valid youtube link
  define_singleton_method :valid_youtube? do |link|
    return ( link.include?("www.") && link.include?("youtube") && link.include?(".com") && !link.include?("watch?"))
  end

  # check if valid imgur link
  define_singleton_method :valid_imgur? do |link|
    return ( link.include?("i.") && link.include?("imgur") && link.include?(".com") )
  end

  # get how many of a type of issue there are in array
  define_singleton_method :issue_of_count do |list, type|
    count = 0
    list.each do |l|
      if l.issue_type == type
        count += 1
      end
    end
    return count
  end
end
