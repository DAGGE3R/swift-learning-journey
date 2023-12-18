protocol HasPages {
	var pageCount: Int { get set }
}
protocol HasTableOfContents {
	var titles: [String] { get set }
}
protocol Book: HasPages, HasTableOfContents {
	var author: String { get set }
}