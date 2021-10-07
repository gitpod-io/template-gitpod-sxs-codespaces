use clap::{App, Arg};

fn main() {
    let matches = App::new("hello")
    .about("A template that demonstrates how to have an isomorphic developer environments between Gitpod and GitHub Codespaces")
    .arg(
        Arg::new("text")
            .short('t')
            .about("The text to print to the console") // Note, we don't need to specify
            .default_value("world")
            .takes_value(true),
    )
    .get_matches();

    let name = matches.value_of("text").unwrap();

    println!("Hello {}!", name);
}
