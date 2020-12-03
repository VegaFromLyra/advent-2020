def valid_passwords(filename)
  entries = File.read(filename).split("\n")

  entries.count do |entry|
    parts = entry.split(":")
    policy = parts[0]
    password = parts[1].strip

    policy_parts = policy.split
    limits = policy_parts[0].split("-")
    letter = policy_parts[1]

    letter_map = freq_map(password)

    min = limits[0].to_i
    max = limits[1].to_i

    count = letter_map[letter].to_i

    count >= min && count <= max
  end
end

def freq_map(word)
  word.chars.inject({}) do |map, char|
    if map.key?(char)
      map[char] += 1
    else
      map[char] = 1
    end

    map
  end
end
