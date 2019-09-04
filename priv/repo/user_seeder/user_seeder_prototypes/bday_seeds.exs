alias Hello
alias Hello.Accounts.User
alias Hello.Repo

## optimization: cache with hash dict
# https://web.archive.org/web/20161116091132/http://ineverfinishanyth.in/2014/01/20/memoization-in-elixir

defmodule Time do
  alias Hello.Repo
  alias Hello.Accounts.User
  # set number of iterations below
  # (below, Time.month_Jan(1,1900,1,1))
  @nStop 1000000
  # do 1 MILLION days


  def month_Jan(n, years, months, days) do
    username = 'User#n'
    
    Hello.Repo.insert!(%Hello.Accounts.User
    {
    id: n,
    name: 'User#{n}',
    username: 'Username#{n}',
    birth_year: years,
    birth_month: months,
    birth_day: days
    })
    # IO.puts ("#{months}, #{days} , #{years}")
      if days == 31 do
        if rem(years,4) == 0 do
          month_Feb_leap(n+1, years, months+1, 1)
        else
          month_Feb(n+1, years, months+1, 1)
        end
    end
    month_Jan(n+1, years, months, days+1)
  end

  def month_Feb(n, years, months, days) do
    
    # IO.puts ("#{months}, #{days} , #{years}")
    Hello.Repo.insert!(%Hello.Accounts.User
    {
    id: n,
    name: 'User#{n}',
    username: 'Username#{n}',
    birth_year: years,
    birth_month: months,
    birth_day: days
    })

    if days == 28 do 
      months_31(n+1, years, months+1, 1)
    end

    month_Feb(n+1, years, months, days+1)
  end


  def months_30(n, years, months, days) do

    # IO.puts ("#{months}, #{days} , #{years}")
    Hello.Repo.insert!(%Hello.Accounts.User
    {
    id: n,
    name: 'User#{n}',
    username: 'Username#{n}',
    birth_year: years,
    birth_month: months,
    birth_day: days
    })

    if days == 30 do
      months_31(n+1, years, months+1, 1)
    end

    months_30(n+1, years, months, days+1)
  end

  def months_31(n, years, months, days) do

    # IO.puts ("#{months}, #{days} , #{years}")
    Hello.Repo.insert!(%Hello.Accounts.User
    {
    id: n,
    name: 'User#{n}',
    username: 'Username#{n}',
    birth_year: years,
    birth_month: months,
    birth_day: days
    })

    if n == @nStop do
      exit(:shutdown)
    end

    if months == 12 and days == 31 and years == 2019 do
      month_Jan(n+1, 1900,  1,   1)
    end

    if months == 7 and days == 31 do
      month_Aug(n+1, years, months+1, 1)
    end
    if rem(n,365) == 0 do
      month_Jan(n+1, years+1,  1,   1)
    end

    

    if days == 31 do
      months_30(n+1, years, months+1, 1)
    end


    months_31(n+1, years, months, days+1)
  end

  def month_Aug(n, years, months, days) do

    # IO.puts ("#{months}, #{days} , #{years}")
    Hello.Repo.insert!(%Hello.Accounts.User
    {
    id: n,
    name: 'User#{n}',
    username: 'Username#{n}',
    birth_year: years,
    birth_month: months,
    birth_day: days
    })
    
    if days == 31 do
      months_30(n+1, years, months+1, 1)
    end

    month_Aug(n+1, years, months, days+1)
  end

  def month_Feb_leap(n, years, months, days) do

    IO.puts ("#{months}, #{days} , #{years}")

    if days == 29 do 
      months_31(n+1, years, months+1, 1)
    end

    month_Feb_leap(n+1, years, months, days+1)
  end

end

IO.puts ("Mos,Days,Years")
Time.month_Jan(1,1900,1,1)
# now seeding all months to 100K?
# Time.month_Jan(1,1900,1,1)


