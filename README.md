# Prairie Garden Catalog

Rails Intro Project · Parneet Kaur

A searchable catalog of fictional prairie garden plants. Three local CSV datasets
populate six SQLite tables with 340 rows. All imported data and styles are included.

## Run on Windows with WSL

1. Extract the ZIP, then open your Ubuntu or Debian WSL terminal. Enter the
   extracted `prairie_garden` folder. For example, if you extracted it directly
   to Downloads on your Windows account:

   ```bash
   cd /mnt/c/Users/parne/Downloads/prairie_garden
   ```

   Adjust the path if you extracted it elsewhere. If you installed Ruby using
   rbenv, check that the terminal uses your existing Ruby 3.3 installation.

2. Run the following inside the project. The folder should contain `Gemfile`.

   ```bash
   ruby -v
   bundle install
   bin/rails db:prepare
   bin/rails db:seed
   bin/rails server -b 127.0.0.1
   ```

   The seed output should show `Total rows: 340`. The explicit seed command
   also works when you already ran the initial setup. It does not duplicate rows.

3. Open [the catalog](http://127.0.0.1:3000) in Chrome or Edge. Leave the server
   running while you demo, then press Ctrl+C to stop it. After initial setup,
   use `bin/rails server -b 127.0.0.1` to start the app again.

If a different app already uses port 3000, run `bin/rails server -b 127.0.0.1 -p 3001` and
open `http://127.0.0.1:3001`. If `bin/rails` is not executable after extracting,
use `bundle exec ruby bin/rails` followed by the same subcommand.

## Demo walkthrough

1. Open **About**. Describe the three CSVs, the shared catalog code, and the
   six-table ERD. Show the seed output in a second terminal.
2. Open **Catalog** and click **Next**. The app shows 12 plants per page.
3. Search **meadow**. Select **Composite-inspired** and search again to show how the
   family dropdown narrows the keyword results. Try **zzzz** to show the
   conditional empty state, then click **Reset**.
4. Search **PG001** and open **Conebloom**. Point out its imported details and
   its links to a family, two habitats and two garden uses. Click a family,
   habitat and garden-use link in turn and use each category page to return to
   the plant.
5. In your editor, open `db/seeds.rb` and `app/models/plant.rb`. Explain how
   the seed script finds a plant by its CSV code and uses Active Record to
   create foreign keys. The model uses `belongs_to` for family and
   `has_many :through` for the other two relationships.
6. Open `app/controllers/plants_controller.rb` to show the keyword search,
   family filter and page offsets. Open `app/views/plants/index.html.erb`
   to show the ERB `if` and Bootstrap grid classes.

### Marking checklist

| Feature | Where to show it |
| --- | --- |
| 1.1 Describe Datasets | About and `db/data/` |
| 1.2 Database ERD | About and `public/erd.svg` |
| 1.3 AR Models | `app/models/` and `db/migrate/` |
| 1.4 At least 1 model Association | Plant and Family models, plus profile and family pages |
| 1.5 Model Associations | Two many-to-many associations through Habitat and GardenUse joins |
| 1.6 Validations | Presence, uniqueness, inclusion and scoped uniqueness rules in `app/models/` |
| 1.7 Data Sources | Three CSVs and 340 rows. Confirm the grading tier for locally authored sources with your instructor. |
| 2.1 About Page | About |
| 2.2 Menu | Header navigation |
| 3.1 Collection Navigation | Catalog |
| 3.2 Member Pages | Individual plant profiles |
| 3.3 Multi-model Data on Member Pages | Family, habitat and garden-use data on a plant profile |
| 3.4 Hierarchical Collection Navigation | Follow a plant link to a category and back |
| 3.5 Pagination | Catalog and filtered catalog results |
| 4.1 Simple Search | Search by name or catalog code |
| 4.2 Hierarchical Search | Search with the family dropdown |
| 5.1 Valid HTML | Rendered HTML for the catalog, group, detail and About pages |
| 5.2 ERB Conditional | Results and empty state in `app/views/plants/index.html.erb` |
| 5.3 Bootstrap Grid | Catalog cards, search controls and profile sections |
| 6.1 GIT and GitHub | Run the GitHub setup below on your own account |
| 6.2 20 GIT Commits | Run `git log --oneline` in the extracted repo |

## Connect GitHub

The ZIP includes the local Git history on branch `master`. Create an **empty**
repository on GitHub in your own account. Leave GitHub's README, license and
.gitignore options unchecked. Then substitute your repository URL:

```bash
git log --oneline
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git push -u origin master
```

The project uses fictional profiles and includes no coordinate dataset or mapping
page (rubric item 3.6).

## How the project is put together

| Location | Role |
| --- | --- |
| `db/data/` | Profile CSV and two relationship CSVs |
| `db/migrate/` | Tables, foreign keys and uniqueness indexes |
| `db/seeds.rb` | Validated, transactional import |
| `app/models/` | Associations and validations |
| `config/routes.rb` | Catalog, categories and About URLs |
| `app/controllers/` | Database queries for each page |
| `app/views/` | ERB templates for navigation, search and profile pages |
| `public/` | Bootstrap CSS, custom styles and database diagram |
