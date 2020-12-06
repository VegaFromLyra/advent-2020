# Each line gives the password policy and then the password.
# The password policy indicates the lowest and highest number of times a given
# letter must appear for the password to be valid.
# For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

# Extension

# Each policy actually describes two positions in the password,
# where 1 means the first character, 2 means the second character, and so on.
# (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) \
# Exactly one of these positions must contain the given letter.
# Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

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

    first_pos = limits[0].to_i - 1
    next_pos = limits[1].to_i - 1

    (password[first_pos] != password[next_pos]) &&
      (password[first_pos] == letter || password[next_pos] == letter)
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


